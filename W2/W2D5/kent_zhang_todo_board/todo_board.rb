require_relative "list.rb"

class TodoBoard
    def initialize
        @list_hash = {}
    end

    def get_command
        print "\nEnter a command: "
        
        cmd, *args = gets.chomp.split
        case cmd
        when 'mklist'
            new_list = List.new(args[0])
            @list_hash[args[0]] = new_list
        when 'ls'
            @list_hash.keys.each { |k| puts k }
        when 'showall'
            @list_hash.values.each { |v| v.print }
        when 'mktodo'
            if args.length == 3
                @list_hash[args[0]].add_item(args[1], args[2])
            else
                @list_hash[args[0]].add_item(args[1], args[2], args[3])
            end
        when 'up'
            if args.length == 2
                @list_hash[args[0]].up(args[1].to_i)
            else
                @list_hash[args[0]].up(args[1].to_i, args[2].to_i)
            end
        when 'down'
            if args.length == 2
                @list_hash[args[0]].down(args[1].to_i)
            else
                @list_hash[args[0]].down(args[1].to_i, args[2].to_i)
            end
        when 'swap'
            @list_hash[args[0]].swap(args[1].to_i, args[2].to_i)
        when 'sort'
            @list_hash[args[0]].sort_by_date!
        when 'priority'
            @list_hash[args[0]].print_priority
        when 'print'
            if args.length == 2
                @list_hash[args[0]].print_full_item(args[1].to_i)
            else
                @list_hash[args[0]].print
            end
        when 'toggle'
            @list_hash[args[0]].toggle_item(args[1].to_i)
        when 'rm'
            @list_hash[args[0]].remove_item(args[1].to_i)
        when 'purge'
            @list_hash[args[0]].purge
        when 'quit'
            return false
        else
            print "Sorry, that command is not recognized."
        end

        true
    end

    def run
        status = true
        while status
            status = get_command
        end
    end
end

board = TodoBoard.new
board.run