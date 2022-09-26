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
end

arr = [1,2,3,4]
block1 = Proc.new {|ele| ele*2}
prc2 = Proc.new {|ele| ele.even?}

p arr.my_each{|ele| ele*2}
p arr.my_select{|ele| ele.even?}