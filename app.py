import re
from flask import *
from psutil import users
import pymysql

from functions import checkpassword
from mpesa import *
app = Flask(__name__)
# session key 
app.secret_key = "123W"
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


@app.route("/register", methods=['GET', 'POST'])
def register():
    msg = ''
    
    if request.method == 'POST':
        if ('username' in request.form and 'email' in request.form and
            'gender' in request.form and 'phone' in request.form and 
            'password' in request.form):
            
            username = request.form['username']
            email = request.form['email']
            gender = request.form['gender']
            phone = request.form['phone']
            password = request.form['password']
            # validate user password 
            # respone = checkpassword(password)
            # if respone == True:
            #     # password MET ALL conditions
            # else:
            #     # password didn't meet all condidions
            #   return render_template("register.html", message = "registered successfully")

            # Password validity check
            # if (len(password) < 6 or
            #     not re.search(r'[A-Z]', password) or 
            #     not re.search(r'[a-z]', password) or  
            #     not re.search(r'[0-9]', password) or
            #     not re.search(r'[!@#$%^&*(),.?":{}|<>]', password)):
            #     msg = 'Password must be at least 6 characters long, contain one uppercase letter, one lowercase letter, one digit, and one special character!'
            #     return render_template("register.html", error=msg)

            # Establish database connection
        connection = pymysql.connect(host='localhost', user='root', password='', database='ModiShop')
        cursor = connection.cursor()

            # # Check if account already exists
            # sql = "SELECT * FROM users WHERE username = %s OR email = %s"
            # cursor.execute(sql, (username, email))
            # account = cursor.fetchone()

            # if account:
            #     msg = 'Account already exists!'
            #     return render_template("register.html", error=msg)

            # elif not re.match(r'[^@]+@[^@]+\.[^@]+', email):
            #     msg = 'Invalid email address!'
            #     return render_template("register.html", error=msg)

            # elif not re.match(r'[A-Za-z0-9]+', username):
            #     msg = 'Username must contain only characters and numbers!'
            #     return render_template("register.html", error=msg)

            # elif not username or not password or not email:
            #     msg = 'Please fill out the form!'
            #     return render_template("register.html", error=msg)

            # Insert new user
        sql = "INSERT INTO users (username, email, gender, phone, password) VALUES (%s, %s, %s, %s, %s)"
        data = (username, email, gender, phone, password)
        cursor.execute(sql, data)
        connection.commit()
        return render_template("register.html", message = "registered successfully")
        
    else:
          return render_template("register.html", error = "please fill the form")





    
@app.route("/login", methods=["GET", "POST"])
def login():
    # Handle GET request to show the login form

        
    
    # Handle POST request for login
    if request.method == "POST":
        email = request.form['email']
        password = request.form['password']
        
        # Connect to the database
        connection = pymysql.connect(host='localhost', user='root', password='', 
                                     database='ModiShop')
        cursor = connection.cursor()
        
        # Check if user with email exists
        sql = "SELECT * FROM users WHERE email = %s AND password = %s"
        data = (email, password)
        
        # Execute the query
        cursor.execute(sql, data)
        
        # Check if any result found
        if cursor.rowcount == 0:
            # Means they were not found
            
            return render_template("login.html", error="Invalid login credentials")
        else:
            session['key'] = email
            # Successful login
              
            return redirect("/")
    else:
        return render_template("login.html")
        
 #mpesa
#  implement STK PUSH 
@app.route('/mpesa', methods = ['POST'])
def mpesa():
    phone = request.form["phone"]
    amount = request.form["amount"]
    # use mpesa_payment function from mpesa.py
    # it accepts the phone and amount as arguments  
    mpesa_payment(amount, phone )
    return '<h1> please complete payment in your phone </h1>' \
        '<a href ="/" class ="btn btn-secondary btn-sm> Go back to products </a>'



@app.route("/logout")
def logout():
   session.clear()  # Clears all session data
   return redirect("/login")

if __name__==("__main__"):
    app.run(debug=True, port=8001)