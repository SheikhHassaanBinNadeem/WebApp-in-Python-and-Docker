from flask import Flask, render_template, request, url_for, session, redirect
from flask_mysqldb import MySQL, MySQLdb
from datetime import *
import time

app = Flask(__name__)

app.config['MYSQL_HOST']='db'
app.config['MYSQL_USER']='root'
app.config['MYSQL_PASSWORD']='12345'
app.config['MYSQL_DB']='Trainer_app_data'
# app.config['MYSQL_PORT'] = 3307
mysql = MySQL(app)
app.secret_key = 'JA8JDO3IEMOMDKLDI3LE93I0EKDAINEUF'

@app.route("/trainer-form")
def trainer():
    if session.get('loggedin'):
        return render_template("trainer_form.html", username=session['username'])
    else:
        return render_template("login.html", msg="Please Log in to continue..")

@app.route("/submission_successful", methods=['POST', 'GET'])
def submission_successful():
    if request.method == "POST":
        fname_data = request.form["fname"]
        lname_data = request.form["lname"]
        design_data = request.form["design"]
        course_data = request.form["course"]
        cdate = date.today()
        sql = "INSERT INTO trainer_details (fname, lname, design, course, datetime) VALUES (%s,%s,%s,%s,%s)"
        val = (fname_data, lname_data, design_data, course_data, cdate)

        # Connection
        cursor = mysql.connection.cursor()

        # Execute SQL QUERY
        cursor.execute(sql,val)

        # commit
        mysql.connection.commit()

        # close
        cursor.close()

        return "Thank you for submitting your details."
    
@app.route("/get_all", methods=['POST', 'GET'])
def get_all():
    cursor = mysql.connection.cursor()
    sql = "select * from trainer_details"
    cursor.execute(sql)
    data = cursor.fetchall()
    return render_template("get_trainer_data.html", output_data=data)

@app.route("/signup")
def signup():
    if session.get('loggedin'):
        return redirect(url_for('trainer'))
    else:
        return render_template("signup.html")

@app.route("/signup_success", methods=['POST','GET'])
def signup_success():
    if request.method == 'POST':
        username = request.form['username']
        email = request.form['email']
        password = request.form['password']
        sql = "SELECT * from student_credentials where username = %s or email = %s"
        value = (username,email)
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute(sql, value)
        account = cursor.fetchone()
        if account:
            return render_template('signup.html',msg='username or email already exist')
        else:
            sql = 'INSERT INTO student_credentials (username,email,password) VALUES (%s,%s,%s)'
            val = (username, email, password)
            cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
            cursor.execute(sql, val)
        # account=cursor.fetchone()
            mysql.connection.commit()
            cursor.close()
            session['loggedin']=True
            # session['id']=account['id']
            session['username']=username
            # return (f'Welcome {username} to Class ki Baaten, Logging you in..')
            # time.sleep(2)
            return redirect(url_for('trainer'))

@app.route("/login")
def login():
    msg=''
    if session.get('loggedin'):
        return redirect(url_for('trainer'))
    else:
        return render_template("login.html")

@app.route("/login_success", methods=['POST', 'GET'])
def login_success():
    msg = ''
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        sql = "SELECT * from student_credentials where username = %s and password = %s"
        value = (username,password)
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute(sql, value)
        account = cursor.fetchone()
        print(account)
        if account:
            session['loggedin']=True
            session['id'] = account['id']
            session['username'] = account ['username']
            return render_template('trainer_form.html', username=session['username'])
        else:
            msg = 'Incorrect Username/Password. Please enter correct credentials.'
        
    return render_template("login.html",msg=msg)

@app.route("/logout")
def logout():
    session.pop('loggedin',None)
    session.pop('id',None)
    session.pop('username',None)
    return redirect(url_for('login'))

if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port="5000")