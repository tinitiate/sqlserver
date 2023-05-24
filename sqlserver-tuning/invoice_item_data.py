import random
import pandas as pd

def prod_list():

    list1 = []
    for c1 in range(1,15):
        # initialize a null list
        list1.append(random.randint(1, 25))

    unique_list = []
    for x in list1:
        # check if exists in unique_list or not
        if x not in unique_list:
            unique_list.append(x)

    return unique_list

# print(prod_list())

csv1 = []
data = []
inv_item_id = 0
for c1 in range(1,20000):
    inv_item_id = inv_item_id+1
    for c2 in prod_list():
        data = [inv_item_id,c1,c2,random.randint(1,9)]
        csv1.append(data)

my_df = pd.DataFrame(csv1)
my_df.to_csv('E:/TinitiateContent/tinitiate-sqlserver/sqlserver-tuning/data/invoice_item.csv', index=False, header=False)
