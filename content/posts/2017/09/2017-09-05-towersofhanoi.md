---
title: 'Towers Of Hanoi in Java'
date: 2017-09-05T05:38:00
draft: false
tags: ["programming"]
---
```
package recursion;

import java.util.Scanner;

public class TowersOfHanoi
{

    public static void main(String[] args)
    {
//      Scanner input = new Scanner(System.in);
//
//      System.out.println("Enter the number of discs: ");
//      int numberOfDiscs = input.nextInt();
//
//      towersOfHanoi(numberOfDiscs, "A", "B", "C");
        towersOfHanoi(3, "A", "B", "C");

    }

    public static void towersOfHanoi(int discs, String source, String to, String destination)
    {
        if (discs == 1)
        {
            System.out.println(source + " --> " + destination);
        }
        else
        {
            towersOfHanoi(discs - 1, source, destination, to);
            System.out.println(source + " --> " + destination);
            towersOfHanoi(discs - 1, to, source, destination);
        }
    }
}
```
