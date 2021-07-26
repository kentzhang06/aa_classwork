require_relative "item.rb"

class List
    attr_accessor :label

    def initialize(label)
        @label = label.upcase
        @items = []
    end

    def add_item(title, deadline, description=nil)
        return false if !Item.valid_date?(deadline)

        if !description
            new_item = Item.new(title, deadline, "" )
        else
            new_item = Item.new(title, deadline, description)
        end

        @items << new_item
        true
    end

    def size
        @items.length
    end

    def valid_index?(index)
        (0..@items.length-1).to_a.include?(index)
    end

    def swap(index_1, index_2)
        return false if !valid_index?(index_1) || !valid_index?(index_2)

        @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
        true
    end

    def [](index)
        return nil if !valid_index?(index)

        @items[index]
    end

    def priority
        @items.first
    end

    def print
        puts '------------------------------------------------------------'
        puts "#{self.label}".center(57)
        puts '------------------------------------------------------------'
        puts 'Index | Item                 | Deadline              | Done'
        puts '------------------------------------------------------------'
        @items.each_with_index do |item, i|
            if item.done
                puts "#{i}     | " + "#{item.title}".ljust(21) + "| #{item.deadline}".ljust(24) + "| [✓]"
            else
                puts "#{i}     | " + "#{item.title}".ljust(21) + "| #{item.deadline}".ljust(24) + "| [ ]"
            end
        end
        puts '------------------------------------------------------------'
    end

    def print_full_item(index)
        current_item = @items[index]
        puts '------------------------------------------------------------'
        if current_item.done
            puts "#{current_item.title}".ljust(31) + "#{current_item.deadline}".ljust(24) + "[✓]"
        else
            puts "#{current_item.title}".ljust(31) + "#{current_item.deadline}".ljust(24) + "[ ]"
        end
        puts current_item.description
        puts '------------------------------------------------------------'
    end

    def print_priority
        print_full_item(0)
    end

    def up(index, amount=nil)
        return false if !self.valid_index?(index)

        if !amount
            self.swap(index, index-1) if index != 0
        else
            curr_item = @items[index]
            amount.times do 
                new_idx = @items.index(curr_item)
                self.swap(new_idx, new_idx-1)
                return true if @items.index(curr_item) == 0
            end
        end
        true
    end

    def down(index, amount=nil)
        return false if !self.valid_index?(index)

        if !amount
            self.swap(index, index+1) if index != @items.length-1
        else
            curr_item = @items[index]
            amount.times do
                new_idx = @items.index(curr_item)
                self.swap(new_idx, new_idx+1)
                return true if @items.index(curr_item) == @items.length-1
            end
        end
        true
    end

    def sort_by_date!
        @items.sort_by! { |item| item.deadline}
    end

    def toggle_item(index)
        @items[index].toggle
    end

    def remove_item(index)
        return false if !valid_index?(index)
        @items.delete_at(index)
    end

    def purge
        items_done = @items.select { |item| item.done}
        items_done.each do |item|
            remove_item(@items.index(item))
        end
    end

end

