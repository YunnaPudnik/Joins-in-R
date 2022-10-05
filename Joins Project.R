
## Installing packages

install.packages(c("dplyr", "janitor"))

## Load libraries

library(dplyr)
library(janitor)

## Let's create dummy sales data

sales <- tibble('Customer ID' = c(1001, 1002, 1003, 1004, 1005, 1006),
                Name = c("James", "Grace", "Moses", "Emmanuel", "Dorcas", "Deborah"),
                Age = c(23, 26, 27, 32, 20, 22),
                Product = c("Kettle", "Television", "Mobile", "Washer", "Lightings", "Oven"))

##Have a look at our data set

sales

## Create a customer data set

customers <- tibble('Customer ID' = c(1002, 1004, 1005, 1007, 1008),
                    Name = c("Park", "Waters", "Ayoola", "Brooks", "Adeoba"),
                    State = c("California", "Newyork", "Santiago", "Texas", "Indiana"))

## Print out customer data

customers

## Clean column names for both tables

sales <- clean_names(sales)
sales

customers <- clean_names(customers)
customers

## Combine tables with merge() function

i.join <- merge(x = sales, y = customers, by = "customer_id")
i.join

## Combine tables with inner_join from dplyr package

i_join <- inner_join(sales, customers, by = "customer_id")
i_join


## Inner join + pipe operator from dplyr package

i_join <- sales %>% inner_join(customers, by = "customer_id")
i_join


## Rename columns

customers <- customers %>%
  rename(cust_id = customer_id)

customers

## Combine tables with different column names 

innjoin <- sales %>% 
  inner_join(customers, by = c("customer_id" = "cust_id"))

innjoin

## Keep the common column, which is used in the join

innjoin <- sales %>% 
  inner_join(customers, by = c("customer_id" = "cust_id"), keep = T)

innjoin

## Give columns the same name and join them

customers <- customers %>%
  rename(customer_id = cust_id)

innerjoin <- sales %>% 
  inner_join(customers, by = "customer_id")

## Next, let's drop columns with the same data

innerjoin <- sales %>% 
  inner_join(customers, by = "customer_id", suffix = c("", ""))

innerjoin

## Rename columns with the same data

innerjoin <- sales %>% 
  inner_join(customers, by = "customer_id") %>% 
  rename(firstname = name.x, surname = name.y) %>% 
  relocate(surname, .after = firstname)
 
innerjoin

## Select particular columns

custdetails <- innerjoin %>% 
  select(customer_id, firstname, surname, product, state)

custdetails


##Perform full/outer join with merge function

f.join <- merge(x = sales, y = customers, all = T)

f.join

##Perform full/outer join with dplyr package

f_join <- sales %>% 
  full_join(customers, by = "customer_id")

f_join

## Left join with merge function

l.join <- merge(sales, customers, "customer_id", all.x = T)

l.join

## Left join with dplyr package

l_join <- sales %>% 
 left_join(customers, "customer_id")

l_join

## Semi join in dplyr 

s.join <- sales %>% 
  semi_join(customers, "customer_id")

s.join

## Anti join in dplyr

a.join <- sales %>% 
  anti_join(customers, "customer_id")

a.join


























