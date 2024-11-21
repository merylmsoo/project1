import os
from flask import Flask, render_template, request, redirect, session
import pymysql
from mpesa import*

app = Flask(__name__)
app.secret_key = "123W"

# Database connection function
def get_db_connection():
    return pymysql.connect(host='localhost', user='root', password='', database='ModiShop')

@app.context_processor
def inject_categories():
    """Inject categories into all templates for the sidebar."""
    connection = get_db_connection()
    cursor = connection.cursor()
    cursor.execute("SELECT DISTINCT product_category FROM products")
    categories = [row[0] for row in cursor.fetchall()]
    connection.close()
    return dict(categories=categories)


# Home page
@app.route("/")
def homepage():
    """Home page displaying all products."""
    connection = get_db_connection()
    cursor = connection.cursor()
    cursor.execute(
        "SELECT product_id, product_name, product_cost, product_image_name, product_category FROM products"
    )
    products = cursor.fetchall()
    connection.close()
    return render_template("index.html", products=products, category="All Products")
# Single item details
@app.route("/single/<product_id>")
def singleitem(product_id):
    connection = get_db_connection()
    cursor = connection.cursor()
    sql = "SELECT * FROM `products` WHERE `product_id`= %s;"
    cursor.execute(sql, product_id)
    product = cursor.fetchone()
    connection.close()
    return render_template("single.html", product=product)

@app.route("/upload", methods=['GET', 'POST'])
def upload():
    if request.method == 'POST':
        # Get form data
        product_name = request.form['product_name']
        product_desc = request.form['product_desc']
        product_cost = request.form['product_cost']
        product_category = request.form['product_category']
        product_image = request.files['product_image_name']

        # Save the uploaded image
        image_folder = os.path.join(app.root_path, 'static', 'images')
        if not os.path.exists(image_folder):
            os.makedirs(image_folder)

        image_path = os.path.join(image_folder, product_image.filename)
        product_image.save(image_path)

        # Insert product data into the database
        connection = get_db_connection()
        cursor = connection.cursor()

        # Use %s for MySQL placeholders
        sql = """
        INSERT INTO products (product_name, product_desc, product_cost, product_category, product_image_name)
        VALUES (%s, %s, %s, %s, %s)
        """
        cursor.execute(sql, (product_name, product_desc, product_cost, product_category, product_image.filename))
        connection.commit()

        cursor.close()
        connection.close()

        return render_template("upload.html", message="Product added successfully")

    return render_template("upload.html")


# Login
@app.route("/login", methods=["GET", "POST"])
def login():
    if request.method == "GET":
        return render_template("login.html")

    if request.method == "POST":
        email = request.form['email']
        password = request.form['password']

        connection = get_db_connection()
        cursor = connection.cursor()

        # Check in users table
        user_sql = "SELECT * FROM users WHERE email = %s AND password = %s"
        user_data = (email, password)
        cursor.execute(user_sql, user_data)
        user = cursor.fetchone()

        # If user not found, check in admin table
        if user is None:
            admin_sql = "SELECT * FROM admin WHERE email = %s AND password = %s"
            admin_data = (email, password)
            cursor.execute(admin_sql, admin_data)
            admin_user = cursor.fetchone()

            if admin_user is None:
                return render_template("login.html", error="Invalid login credentials")
            else:
                # Admin login success
                session['key'] = admin_user[1]  # Store admin email in session
                return redirect("/admindashboard")  # Redirect to admin dashboard

        else:
            # User login success
            session['key'] = user[1]  # Store user email in session
            return redirect("/")  # Redirect to homepage

    return render_template("login.html")

# Admin dashboard
@app.route("/admindashboard")
def admin_dashboard():
    if 'key' in session:
        return render_template("admindashboard.html")
    else:
        return redirect("/login")

# Logout
@app.route("/logout")
def logout():
    session.clear()  # Clears all session data
    return redirect("/login")

# Register
@app.route("/register", methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        username = request.form['username']
        email = request.form['email']
        gender = request.form['gender']
        phone = request.form['phone']
        password = request.form['password']

        connection = get_db_connection()
        cursor = connection.cursor()
        sql = "INSERT INTO users (username, email, gender, phone, password) VALUES (%s, %s, %s, %s, %s)"
        data = (username, email, gender, phone, password)
        cursor.execute(sql, data)
        connection.commit()
        connection.close()

        return render_template("register.html", message="Registered successfully")

    else:
        return render_template("register.html", error="Please fill the form")

# Add user
@app.route("/adduser", methods=['GET', 'POST'])
def add_user():
    if request.method == 'POST':
        # Fetch form data
        username = request.form['username']
        email = request.form['email']
        gender = request.form['gender']
        phone = request.form['phone']
        password = request.form['password']

        # Validate the form data
        if not username or not email or not password:
            return render_template('adduser.html', error="Please fill in all required fields")

        # Add user to the database
        connection = get_db_connection()
        cursor = connection.cursor()
        sql = "INSERT INTO users (username, email, gender, phone, password) VALUES (%s, %s, %s, %s, %s)"
        data = (username, email, gender, phone, password)
        cursor.execute(sql, data)
        connection.commit()
        connection.close()

        return render_template("adduser.html", message="User added successfully")

    return render_template("adduser.html")

# Manage users
@app.route("/manageusers")
def manage_users():
    if 'key' not in session:
        return redirect("/login")

    connection = get_db_connection()
    cursor = connection.cursor()

    # Fetch all users from the database
    cursor.execute("SELECT * FROM users")
    users = cursor.fetchall()
    connection.close()

    return render_template("manageusers.html", users=users)


# Edit user (POST only)
@app.route("/edituser/<int:id>", methods=["POST"])
def edit_user(id):
    if 'key' not in session:
        return redirect("/login")

    connection = get_db_connection()
    cursor = connection.cursor()

    # Update user in the database
    username = request.form['username']
    email = request.form['email']
    gender = request.form['gender']
    phone = request.form['phone']

    sql = "UPDATE users SET username=%s, email=%s, gender=%s, phone=%s WHERE id=%s"
    cursor.execute(sql, (username, email, gender, phone, id))
    connection.commit()
    connection.close()

    return redirect("/manageusers")


# Delete user
@app.route("/deleteuser/<int:id>")
def delete_user(id):
    if 'key' not in session:
        return redirect("/login")

    connection = get_db_connection()
    cursor = connection.cursor()

    # Delete the user from the database
    cursor.execute("DELETE FROM users WHERE id = %s", (id,))
    connection.commit()
    connection.close()

    return redirect("/manageusers")

@app.route("/manageproducts")
def manage_products():
    if 'key' not in session:
        return redirect("/login")

    connection = get_db_connection()
    cursor = connection.cursor()

    # Fetch all products from the database
    cursor.execute("SELECT * FROM products")
    products = cursor.fetchall()
    connection.close()

    return render_template("manageproducts.html", products=products)


# Edit product
@app.route("/editproduct/<int:product_id>", methods=["POST"])
def edit_product(product_id):
    if 'key' not in session:
        return redirect("/login")

    connection = get_db_connection()
    cursor = connection.cursor()

    # Update product in the database
    product_name = request.form['product_name']
    product_desc = request.form['product_desc']
    product_cost = request.form['product_cost']
    product_category = request.form['product_category']

    sql = "UPDATE products SET product_name=%s, product_desc=%s, product_cost=%s, product_category=%s WHERE product_id=%s"
    cursor.execute(sql, (product_name, product_desc, product_cost, product_category, product_id))
    connection.commit()
    connection.close()

    return redirect("/manageproducts")


# Delete product
@app.route("/deleteproduct/<int:product_id>")
def delete_product(product_id):
    if 'key' not in session:
        return redirect("/login")

    connection = get_db_connection()
    cursor = connection.cursor()

    # Delete the product from the database
    cursor.execute("DELETE FROM products WHERE product_id = %s", (product_id,))
    connection.commit()
    connection.close()

    return redirect("/manageproducts")

@app.route("/siteanalytics")
def siteanalytics():
    # Here you can fetch the necessary data from the database for analytics.
    connection = get_db_connection()
    cursor = connection.cursor()

    # Example queries to get user visits and product views
    cursor.execute("SELECT COUNT(*) FROM users")  # Total number of users
    total_users = cursor.fetchone()[0]

    cursor.execute("SELECT COUNT(*) FROM products")  # Total number of products
    total_products = cursor.fetchone()[0]

    # Fetch sales data (example)
    cursor.execute("SELECT SUM(product_cost) FROM products")  # Total sales amount
    total_sales = cursor.fetchone()[0]

    connection.close()

    return render_template("siteanalytics.html", total_users=total_users, total_products=total_products, total_sales=total_sales)
@app.route("/managecategories", methods=["GET"])
def manage_categories():
    connection = get_db_connection()
    cursor = connection.cursor()
    cursor.execute("SELECT product_category FROM products")
    categories = cursor.fetchall()
    connection.close()
    return render_template("categorymanagement.html", categories=categories)

@app.route("/addcategory", methods=["POST"])
def add_category():
    category_name = request.form["category_name"]
    connection = get_db_connection()
    cursor = connection.cursor()
    cursor.execute("INSERT INTO products (product_category) VALUES (%s)", (category_name,))
    connection.commit()
    connection.close()
    return redirect("/manage_categories")

@app.route("/deletecategory/<string:category_name>", methods=["GET"])
def delete_category(category_name):
    connection = get_db_connection()
    cursor = connection.cursor()
    cursor.execute("DELETE FROM products WHERE product_category = %s", (category_name,))
    connection.commit()
    connection.close()
    return redirect("/manage_categories")
@app.route('/category/<category_name>')
def category_view(category_name):
    """Display products of a specific category."""
    connection = get_db_connection()
    cursor = connection.cursor()
    cursor.execute(
        "SELECT product_id, product_name, product_cost, product_image_name FROM products WHERE product_category = %s",
        (category_name,)
    )
    products = cursor.fetchall()
    connection.close()
    return render_template('index.html', products=products, category=category_name)
@app.route('/mpesa', methods=['POST'])
def mpesa():
    phone = request.form.get("phone")  # Use .get() to avoid KeyError if form data is missing
    amount = request.form.get("amount")
    
    # Call the function to process MPESA payment
    mpesa_payment(amount, phone)
    
    # Return a proper HTML response
    return render_template('mpesa.html')

    


if __name__ == "__main__":
    app.run(debug=True)
