class LinkedList
  def sort
    output_list = LinkedList.new(self.remove(0))
    to_add = self.remove(0)
    until to_add == nil
      counter = 0
      until output_list[counter].value > to_add.value
        counter += 1
      end
      output_list.insert(to_add)
      to_add = self.remove(0)
    end
    output_list
  end
end