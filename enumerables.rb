require "byebug"
class Array
    def my_each (&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end
        self
    end

    def my_select(&prc)
        i = 0
        finalArray = []
        while i < self.length
            finalArray << self[i] if prc.call(self[i])
            i+=1
        end
        finalArray
    end

    def my_reject(&prc)
        i = 0
        finalArray = []
        while i < self.length
            finalArray << self[i] if !prc.call(self[i])
            i+=1
        end
        finalArray
    end

    def my_any?(&prc)
        i = 0 
        while i < self.length
            return true if prc.call(self[i])
            i +=1
        end
        false
    end

    def my_all?(&prc)
        i = 0
        counter = 0
        while i < self.length
            counter += 1 if prc.call(self[i])
            i +=1
        end
        return true if counter == self.length
        false
    end

    def my_flatten 
        result = []
        self.each do |ele| # ele = array or num or string
            if ele.is_a?(Array)
                result += ele.my_flatten 
            else
                result << ele
            end
        end
        result
    end

end

p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten

arr = [1,2,3,4]
block1 = Proc.new {|ele| ele*2}
prc2 = Proc.new {|ele| ele.even?}

p arr.my_each{|ele| ele*2}
p arr.my_select{|ele| ele.even?}
p arr.my_reject{|ele| ele.even?}

a = [1, 2, 3]
p a.my_any? { |num| num > 1 } # => true
p a.my_any? { |num| num == 4 } # => false
p a.my_all? { |num| num > 1 } # => false
p a.my_all? { |num| num < 4 } # => true

