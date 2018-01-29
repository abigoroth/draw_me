require 'rails/railtie'
require "draw_me/version"

module DrawMe 
  extend ActiveSupport::Concern
  
  def draw_me
    self_class = self.class.name.gsub("Rfq::", "")
    tmp = "class #{(self_class.downcase).capitalize}Graph < ApplicationRecord \n"
    tmp << " self.table_name = '#{self.class.table_name}' \n"
    tmp << " enum aasm_state: {#{self.aasm.states.map.with_index{|x,i| "#{x.name}: #{i}" }.join(', ')}} do \n"
    self.class.aasm.events.each_with_index do |event,i|
      # puts event.inspect 
      # next if i > 0
      next if event.transitions.count == 0
      tmp << "  event :#{event.name} do \n"
      event.transitions.each do |transition|
        tmp << "   transition :#{transition.from} => :#{transition.to} \n"
      end
      tmp << "  end \n\n"
    end
    tmp << " end \n"
    tmp << "end"
    # File.open("/lib/graph/")
    # IO.write("#{Rails.root}/lib/graph/#{self_class}.rb", tmp)
    file = "#{Rails.root}/app/models/#{self_class.downcase}_graph.rb"
    File.open("#{file}", 'w+') {|f| f.write(tmp) }
    puts "#{self_class.downcase}_graph"
    %x[ DEST_DIR=doc rails g stateful_enum:graph #{(self_class.downcase).capitalize}_graph ]
    File.delete(file)
    # puts tmp
  end

  # ["#{Rails.root}/app/models", "#{Rails.root}/app/models/rfq"]
  class_methods do 
    def draw_all
      ["#{Rails.root}/app/models"].each do |path|
        Dir.foreach(path) do |model_path|
          namez = model_path.split("_").map{|x| x.capitalize}.join.gsub(".rb", "")
          if (namez =~ /[a-zA-Z]/) != nil && (model_path =~ /.rb/) != nil
            namez = "Rfq::" + namez if (path =~ /rfq/) != nil
            puts namez
            # Looking for model with AASM only
            hm = "#{namez}.try(:aasm)"
            puts hm
            tmp = eval(hm)
            if tmp
              puts model_path
              puts namez
              tmp = eval(namez)
              tmp = tmp.new
              tmp.draw_me
            end
          end
        end
      end
    end
  end

  # Your code goes here...
end
