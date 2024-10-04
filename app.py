from flask import *
import pymysql
app = Flask(__name__)
@app.route("/")
def Homepage():
# connect to db
 connection = pymysql.connect(host='localhost', user='root', password='', database='ModiShop')
 sql = "SELECT * FROM `products` WHERE `product_category` = 'phones';"
 sql1 = "SELECT * FROM `products` WHERE `product_category` = 'electronics';"
 sql2 = "SELECT * FROM `products` WHERE `product_category` = 'fashion';"
 sql3 = "SELECT * FROM `products` WHERE `product_category` = 'Beauty';"
 sql4 = "SELECT * FROM `products` WHERE `product_category` = 'appliances';"
 sql5 = "SELECT * FROM `products` WHERE `product_category` = 'grooming';"
#  you need to have a cursor 
# cursor is used to run/execute above sql
 cursor = connection.cursor()
 cursor1 = connection.cursor()
 cursor2 = connection.cursor()
 cursor3 = connection.cursor()
 cursor4 = connection.cursor()
 cursor5 = connection.cursor() 
#  execute
 cursor.execute(sql)
 cursor1.execute(sql1)
 cursor2.execute(sql2)
 cursor3.execute(sql3)
 cursor4.execute(sql4)
 cursor5.execute(sql5)
#  fetch  all phone rows

 phones = cursor.fetchall()
 electronics = cursor1.fetchall()
 fashion = cursor2.fetchall()
 Beauty = cursor3.fetchall()
 appliances=cursor4.fetchall()
 grooming = cursor5.fetchall()
 return render_template("index.html", phones = phones, electronics= electronics, fashion= fashion, Beauty= Beauty, appliances = appliances, grooming = grooming)
 

# route for single item
@app.route("/single/<product_id>")
def singleitem(product_id):
    # connetion to db
 connection = pymysql.connect(host='localhost', user='root', password='', database='ModiShop')
#  create sql query 
 sql= "SELECT * FROM `products` WHERE `product_id`= %s;"
 cursor =connection.cursor()
 cursor.execute(sql,product_id)
 product = cursor.fetchone()
 return render_template("single.html", product= product)
    
# upload products
@app.route("/upload", methods = ['POST', 'GET'])
def upload():
    if request.method == 'POST':
        # user can add the products
        product_name = request.form['product_name']
        product_desc = request.form['product_desc']
        product_cost = request.form['product_cost']
        product_category = request.form['product_category']
        product_image_name = request.files['product_image_name']
        product_image_name.save('static/images/' + product_image_name.filename)
        # connect to db
        connection = pymysql.connect(host='localhost', user='root', password='', database='ModiShop')
        # create a cursor 
        cursor = connection.cursor()
        sql = "insert into products (product_name, product_desc, product_cost, product_category, product_image_name) values (%s, %s, %s, %s,%s)"
        data = (product_name, product_desc, product_cost, product_category, product_image_name.filename)
        # execute 
        cursor.execute(sql, data)
        # save changes 
        connection.commit()
        return render_template("upload.html", message = "product added successfully")
        
    else:
          return render_template("upload.html", error = "please add a product")

# fashion route 
# helps you to see all the fashions
@app.route("/fashion")
def fashion ():
    # coonection to db 
    connection = pymysql.connect(host='localhost', user='root', password='', database='ModiShop')
    sql = "SELECT * FROM `products` WHERE `product_category` = 'dresses';"
    sql1 = "SELECT * FROM `products` WHERE `product_category` = 'handbags';"
    sql2 = "SELECT * FROM `products` WHERE `product_category` = 'cap';"
    sql3 = "SELECT * FROM `products` WHERE `product_category` = 'socks';"
    sql4 = "SELECT * FROM `products` WHERE `product_category` = 'belt';"
    
    # create a cursor 
    cursor = connection.cursor()
    cursor1 = connection.cursor()
    cursor2 =connection.cursor()
    cursor3 =connection.cursor()
    cursor4 = connection.cursor()
    # execute
    cursor.execute(sql)
    cursor1.execute(sql1)
    cursor2.execute(sql2)
    cursor3.execute(sql3)
    cursor4.execute(sql4)
    # fetch all dresses 
    dresses = cursor.fetchall()
    handbags = cursor1.fetchall()
    cap =cursor2.fetchall()
    socks = cursor3.fetchall()
    belt = cursor4.fetchall()
    return render_template("fashion.html", dresses = dresses, handbags = handbags, cap = cap, socks = socks, belt = belt)
# route to upload fashion 
@app.route("/uploadfashion", methods = ['POST', 'GET'])
def uploadfashion():
    if request.method == 'POST':
        # USER CAN ADD FASHION 
        product_name = request.form['product_name']
        product_desc = request.form['product_desc']
        product_cost = request.form['product_cost']
        product_category = request.form['product_category']
        product_image_name = request.files['product_image_name']
        product_image_name.save('static/images/' + product_image_name.filename)
        # commection to db 
        connection = pymysql.connect(host='localhost', user='root', password='', database='ModiShop')
        # create a cursor
        cursor = connection.cursor()
        sql = "insert into products (product_name, product_desc, product_cost, product_category, product_image_name) values (%s, %s, %s, %s,%s)"
        data = (product_name, product_desc, product_cost, product_category, product_image_name.filename)
        # execute 
        cursor.execute(sql, data)
        # save changes 
        connection.commit()
        return render_template("uploadfashion.html", message = "fashion added successfully")
        
    else:
          return render_template("uploadfashion.html", error = "please add a fashion")
        
  
    

@app.route("/about")
def about():
    return "this is my about page"

@app.route("/register")
def register():
    return "this is my register page"

@app.route("/login")
def login():
    return "this is my login page"

@app.route("/logout")
def logout():
    return "this is my logout page"

if __name__==("__main__"):
    app.run(debug=True, port=8001)