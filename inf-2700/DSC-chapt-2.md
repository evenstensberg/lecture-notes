## Introduction to the Relational Model

The relational model remains the primary data model for busineses data-processing applications. It got its reputation based on its simplicity, which makes the job of a developer less burdensome. As any other programming language, it has developed features to stay up-to-date. Amongst those features are: object-relational features, like complex data types and stored procedures as well as support for XML data. 

The relational models independence from any specific underlying low-level data structures makes it a good choice to most programmers and it allowed it to persist despite the rise to new approaches to backend.

## Structure of Relational Databases 2.1

A relational database consists of a collection of tables, each of which is assigned an unique name. A table "instructor" consists of four column headers: `ID`, `name`, `dept_name` and `salary`. Each row of the table records information about an instructor, that has the instructors ID, name, dept_name and salary. Similarly, a course table consists of information about each course, with its `course_id` and name. Using the instructors example, we have a row, where we have a pair of course identifiers, such as the second course being a prerequisite for the first course. This indicates that the two courses are related in some sense that the one course is a prereq of the other.

## Row

**In general, a row in a table represents a relationship amongst a set of values.** Since a table is a collection of these relationshops, there is a correspodence between the concept 
of table and the mathematical concept of relation, from where relational data model takes its name.

## Tuple

In maths, a tuple is a sequence of values ( or a list of values). A relationship between n values is represented mathematically by an n-tuple of values, which is, a tuple with n values :D

These tuples of n values correspond to a row in a table. Even though, in the relation model the term relation is used to refer to a table, while the term tuple is used to refer to a row, similarly, the term **attribute** refers to a column of a table.

## Relation Instance

We use the convention **relation instance** to refer to a specific instance of a relation, that is, containing a specific set of rows. The instance of instructor has 12 tuples, corresponding to 12 instructors. 

## Domain

A domain is a permitted value known to the attribute. This could be for instance, that the domain of the salary attribue of the instructor relation is the set of all possible salary values, while the domain of the name attribute is the set of all possible instructor names. We require that, for all relations r, the domains of all attributes of r be atomic. A domain is **atomic** if elements of the domain are considered to be indivisible units. This could be that the instructor table had an attribute phone_number, which can store a set of phone numbers corresponding to the instructor. Then the domain of phone_number would not be atomic, since an element of the domain is a set of phone_numbers, and it has subparts, namely, the individual phone numbers in the set. Suppose that phone_number stores a single phone number. Even then, if we split the value from the phone number attribute into a country code, an area code, and a local number, we would be treating it as a non-atomic value. If we treat each phone number as a single indivisible unit, then the attribue phone_number would have an atomic domain.

The **null value** is a special value that signifies that the value is uknown or does not exist.

## Database Schema


When we talk about a db we must diff between a database schema which is the logical design of the database and the database instance, which is a snapshot of the data in the daatabase at a given time. The concept of a relation corresponds to the programming-language notation of a variable, while the concept of a relation schema corresponds to the programming-language notion of type definition. In general, a relation schema consists of a list of attributes and their corresponding domains.
