# Your boss comes out of their office and says:
# "We need to chagne our Warehouse app. We now allow people to pay more money, to get their deliveries earlier."
#
# You need to take and process orders. Process just means tell the warehouse folk which order todo first from teh Warehouse.
#
# Orders come in as a Ruby Hash via Warehouse.receive and the lower the number, the high priority it gets.
# So, if you have 2 orders... one being a priority 1, another being a priority 2... process the 1 first from the orders.

# Example order:
# order = { priority: 1,
#           product: "boots",
#           address: "633 Folsom St."
# }

class Warehouse
  @@orders = {}

  def self.orders
    @@orders
  end

  def self.print_orders
    p "Current orders: #{@@orders}"
  end

  # Add to orders
  def self.recieve(order)
    if @@orders[order[:priority]] == nil
      @@orders[order[:priority]] = [order]
    else
      @@orders[order[:priority]] << order
    end
  end

  # Tell the warehouse which order to process
  def self.process                # O(n^2)
    @@orders.each_key do |queue|
      until @@orders[queue].empty?
        p "Processing: #{@@orders[queue].shift}"
      end
      @@orders.delete(queue)      # Clean up empty queue
    end
  end
end


# Driver Code ===================================================

# Tests orders
data = [
  {priority: 1, product: "boots", address: "633 Folsom St."},
  {priority: 1, product: "adidas", address: "633 Folsom St."},
  {priority: 1, product: "nike", address: "633 Folsom St."},
  {priority: 2, product: "NB", address: "633 Folsom St."},
  {priority: 3, product: "vans", address: "633 Folsom St."},
  {priority: 4, product: "asic", address: "633 Folsom St."}
]

# Add orders to process
data.each do |order|
  Warehouse.recieve(order)
end

Warehouse.process    # Process orders
