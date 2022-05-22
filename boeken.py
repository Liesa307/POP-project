import mysql.connector
import pyodbc
import pandas as pd
import time

print('Please note that all inputs must be spelled correctely!')
print()
print('Overview')
print('')
print('What would you like to do?' + '\n' + 'A: vieuw Database Liesa' + '\n' 'B: vieuw Database Katrien' + '\n')
choice = input('Please enter your choice: ')
time.sleep(0.5)
while choice not in ('a', 'A', 'b', 'B'):
    print('What would you like to do?' + '\n' + 'A: vieuw Database Liesa' + '\n' 'B: vieuw Database Katrien' + '\n')
    choice = input('Please enter your choice: ')
time.sleep(0.5)
if choice == 'A' or choice == 'a':
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="1234",
        database="boeken"
    )

    mycursor = mydb.cursor()

    new_result = []

    mycursor.execute(
        "SELECT writer.first_name, writer.name, book.title_book FROM writer INNER JOIN book on writer.writer_id=book.writer_id")
    records = mycursor.fetchall()
    mycursor.execute(
        "SELECT writer.first_name, writer.name, strip.title_strip FROM writer INNER JOIN strip on writer.writer_id=strip.writer_id")
    records_strip = mycursor.fetchall()

    print("Printing database Liesa")
    print()
    print('boeken')
    for row in records:
        print("firstname writer: ", row[0])
        print("surname: ", row[1])
        print("title book: ", row[2])
        print("\n")
    print('strips')
    for row in records_strip:
        print("firstname writer: ", row[0])
        print("surname: ", row[1])
        print("title strip: ", row[2])
        print("\n")
    print()
    time.sleep(0.5)
    print(
        'What would you like to do?' + '\n' + 'A: search for title book' + '\n' + 'B: search for author' + '\n')
    choice = input('Please enter your choice: ')
    time.sleep(0.5)
    while choice not in ('a', 'A', 'b', 'B'):
        print(
            'What would you like to do?' + '\n' + 'A: search for title book' + '\n' + 'B: search for author' + '\n')
        choice = input('Please enter your choice: ')
        time.sleep(0.5)
    if choice == 'a' or choice == 'A':
        title = input('Enter the book title: ')
        mydb = mysql.connector.connect(
            host="localhost",
            user="root",
            password="1234",
            database="boeken"
        )

        mycursor = mydb.cursor()

        new_result = {}

        mycursor.execute(
            "SELECT writer.first_name, writer.name, book.title_book FROM writer INNER JOIN book on writer.writer_id=book.writer_id")
        records_liesa = mycursor.fetchall()
        mycursor.execute(
            "SELECT writer.first_name, writer.name, strip.title_strip FROM writer INNER JOIN strip on writer.writer_id=strip.writer_id")
        records_strip = mycursor.fetchall()
        for row in records_liesa:
            if row[2] == str(title):
                print("firstname writer:", row[0])
                print("surname:", row[1])
                print("booktitle:", row[2])
                print()
        for row in records_strip:
            if row[2] == str(title):
                print("firstname writer:", row[0])
                print("surname:", row[1])
                print("striptitle:", row[2])
                print()

        mycursor.close()
        mydb.close()
        time.sleep(0.5)

    elif choice == 'b' or choice == 'B':
        name = input('Enter de writers firstname or surname: ')
        mydb = mysql.connector.connect(
            host="localhost",
            user="root",
            password="1234",
            database="boeken"
        )

        mycursor = mydb.cursor()

        new_result = {}

        mycursor.execute(
            "SELECT writer.first_name, writer.name, book.title_book FROM writer INNER JOIN book on writer.writer_id=book.writer_id")
        records_liesa = mycursor.fetchall()
        mycursor.execute(
            "SELECT writer.first_name, writer.name, strip.title_strip FROM writer INNER JOIN strip on writer.writer_id=strip.writer_id")
        records_strip = mycursor.fetchall()
        print("database Liesa")
        for row in records_liesa:
            if row[0] == str(name) or row[1] == str(name):
                print("firstname writer:", row[0])
                print("surname:", row[1])
                print("booktitle:", row[2])
                print()
        for row in records_strip:
            if row[0] == str(name) or row[1] == str(name):
                print("firstname writer:", row[0])
                print("surname:", row[1])
                print("striptitle:", row[2])
                print()
        mycursor.close()
        mydb.close()
        time.sleep(0.5)


elif choice == 'B' or choice == 'b':
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="1234",
        database="boeken2"
    )

    mycursor = mydb.cursor()

    new_result = []

    mycursor.execute(
        "SELECT writer.first_name, writer.name, book.title_book FROM writer INNER JOIN book on writer.writer_id=book.writer_id")
    records_boeken2 = mycursor.fetchall()
    mycursor.execute(
        "SELECT writer.first_name, writer.name, strip.title_strip FROM writer INNER JOIN strip on writer.writer_id=strip.writer_id")
    records_strip = mycursor.fetchall()

    print("Printing database Katrien")
    print()
    time.sleep(0.5)
    print('Boeken')
    for row in records_boeken2:
        print("firstname writer:", row[0])
        print("surname:", row[1])
        print("booktitle:", row[2])
        print("\n")
    print()
    print('strips')
    for row in records_strip:
        print("firstname writer:", row[0])
        print("surname:", row[1])
        print("striptitle:", row[2])
        print("\n")
    print()
    time.sleep(0.5)
    print(
        'What would you like to do?' + '\n' + 'A: search for title book' + '\n' + 'B: search for author' + '\n')
    choice = input('Please enter your choice: ')
    time.sleep(0.5)
    while choice not in ('a', 'A', 'b', 'B'):
        print(
            'What would you like to do?' + '\n' + 'A: search for title book' + '\n' + 'B: search for author' + '\n')
        choice = input('Please enter your choice: ')
    time.sleep(0.5)
    if choice == 'a' or choice == 'A':
        title = input('Enter the book title: ')
        mydb = mysql.connector.connect(
            host="localhost",
            user="root",
            password="1234",
            database="boeken2"
        )

        mycursor = mydb.cursor()

        new_result = {}

        mycursor.execute(
            "SELECT writer.first_name, writer.name, book.title_book FROM writer INNER JOIN book on writer.writer_id=book.writer_id")
        records_liesa = mycursor.fetchall()
        mycursor.execute(
            "SELECT writer.first_name, writer.name, strip.title_strip FROM writer INNER JOIN strip on writer.writer_id=strip.writer_id")
        records_strip = mycursor.fetchall()
        for row in records_liesa:
            if row[2] == str(title):
                print("firstname writer:", row[0])
                print("surname:", row[1])
                print("booktitle:", row[2])
                print()
        for row in records_strip:
            if row[2] == str(title):
                print("firstname writer:", row[0])
                print("surname:", row[1])
                print("booktitle:", row[2])
                print()
        mycursor.close()
        mydb.close()
        time.sleep(0.5)

    elif choice == 'b' or choice == 'B':
        name = input('Enter de writers firstname or surname: ')
        mydb = mysql.connector.connect(
            host="localhost",
            user="root",
            password="1234",
            database="boeken2"
        )

        mycursor = mydb.cursor()

        new_result = {}

        mycursor.execute(
            "SELECT writer.first_name, writer.name, book.title_book FROM writer INNER JOIN book on writer.writer_id=book.writer_id")
        records_liesa = mycursor.fetchall()
        mycursor.execute(
            "SELECT writer.first_name, writer.name, strip.title_strip FROM writer INNER JOIN strip on writer.writer_id=strip.writer_id")
        records_strip = mycursor.fetchall()
        print("database Katrien")
        for row in records_liesa:
            if row[0] == str(name) or row[1] == str(name):
                print("firstname writer:", row[0])
                print("surname:", row[1])
                print("booktitle:", row[2])
                print()
        for row in records_strip:
            if row[0] == str(name) or row[1] == str(name):
                print("firstname writer:", row[0])
                print("surname:", row[1])
                print("booktitle:", row[2])
                print()
        mycursor.close()
        mydb.close()
        time.sleep(0.5)

