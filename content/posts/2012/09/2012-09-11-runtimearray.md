---
title: 'Runtime Array in C#'
date: 2012-09-11T13:11:00
draft: false
tags: ["programming"]
---
```
/*
 * This program, accepts the size of the array from the user.
 * Check to see if the size is a number, if its not, it will
 * display a message and terminate.
 * If it is, the user is asked to enter the elements into the
 * array.
 * Each element is parsed into int. if it is not successful, a
 * message is displayed.
 * there are two functions which do the same conversion, but
 * display different exit messages depending on the element that
 * is incorrect. The last element will have a different exit message
 * if the value is incorrect.
*/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace RuntimeArray
{
    class RuntimeArray
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Enter the size of the array: ");
            string s = Console.ReadLine();
            int size;
            //take the number in string s, convert it into int and store it in size
            bool NumerOrNot = Int32.TryParse(s, out size);

            //if s is not a number, print out a message and exit
            if (!NumerOrNot)
            {
                Console.WriteLine("This is not a number. ");
                Console.WriteLine("Press enter to terminate.");
                Console.Read();
            }

            string[] s1 = new string[size];
            Console.WriteLine("Enter {0} numbers", size);
            for (int i = 0; i < size; i++)
            {
                //reading elements from the console
                s1[i] = Console.ReadLine();
                //the exit message is different for the last element of the array
                if (i == size - 1)
                {
                    //a different function is called with a different exit message
                    //this function will try to parse the element into int.
                    TryToParse2(s1[i]);

                }
                else
                {
                    //this function will try to parse the element into int.
                    TryToParse(s1[i]);
                }

            }
            Console.WriteLine("All the elements entered so far: ");
            for (int j = 0; j < size; j++)
            {
                Console.WriteLine("Element {0}: {1}", j, s1[j]);
            }
            Console.WriteLine("Press enter to terminate.");
            Console.Read();
        }
        public static bool TryToParse(string s2)
        {
            int number;

            s2.Trim();
            bool result = Int32.TryParse(s2, out number);

            if (result)
            {
                Console.WriteLine("The string {0}, has been parsed into the number: {1}", s2, number);
            }
            else
            {
                Console.WriteLine("This is not a number. Enter a number: ");

            }
            return true;
        }
        public static bool TryToParse2 (string s3)
        {
            int number;

            s3.Trim();
            bool result = Int32.TryParse(s3, out number);

            if (result)
            {
                Console.WriteLine("The string {0}, has been parsed into the number: {1}", s3, number);
            }
            else
            {
                Console.WriteLine("This is not a number.");

            }
            return true;
        }
    }
}
```
