You have a new job at a hot startup called Awesome Delivery Service. They’re awesome!  ADC takes in orders and delivers them. If a customer pays more money, your order is processed and arrives faster. For this we’ll use an abstract data type called a Priority Queue. For our use, a Priority Queue is an array of Queues.

```
@priority_queue = [ Queue, Queue, …, …, … ]
```

Index 0 is the highest priority and are processed first.  Create a class called “Warehouse” that take in orders with a priority and then processes an order with  the highest priority. The #in method takes 2 arguments, number of units and a priority.  e.g.  warehouse = Warehouse.new

Note: .in method arguments are: ( units, priority ) 
```
warehouse.in(5, 4)
warehouse.in(1, 3)
warehouse.in(3, 2)
 warehouse.process # 3, 2 is processed first though its the last in!
```
