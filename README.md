# City Living Quality Evaluation System
By Peiyuan Sun & Xinzhi Zhang

A DBMS web application based on python and MySQL. You can learn how to use it in this [video](https://youtu.be/WAs-7DiVnVw).

## Step 1: Required Python Modules
[flask (a micro web framework written in Python)](http://flask.pocoo.org/): 

```
pip install flask
```

[pymysql (a pure-Python MySQL client library)](https://github.com/PyMySQL/PyMySQL): 

```
pip install pymysql
```

## Step 2: Import the Database
Download the [self-contained dump file](https://github.com/hohoXin/CS5200-final/blob/b41122210d3d8e2546e0aaae48708be0196190dd/city_evaluation_dump.sql) and open it in MySQL Workbench. Execute the file and ensure `city_evaluation` database has been created. 

Note: Once the import has completed, the tables in `city_evaluation` should contain schemas, data and procedures.

## Step 3: Run the Project
Once you have cloned this repository and navigated to the directory in your terminal, simply run
```
python run.py
```
Enter your MySQL username and password, 

```
MySQL Username: <username>
MySQL Password: <password>
```

and then navigate to `localhost:9494` in your browser.


## ER Graph
<img src="https://github.com/hohoXin/CS5200-final/blob/main/ER_city.jpg?raw=true"/>


## Flow Chart
![](https://github.com/hohoXin/CS5200-final/blob/main/flowchart.jpg?raw=true)
