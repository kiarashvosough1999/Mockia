# ``Mockia``

Easy Handling Mock's internal Expectations in Swift.

## Overview

Ever tried to pu expectations inside the mock object? It is not best practice to directly put `XCAssert` inside mocks and check somthing on every unit test.

What if on one unit everythings change and the asseration fails and not valid anymore?

With `Mockia` can enable you to put expectations inside mock object and verify them the way unit test requires. You can set factual actions inside your mocks and expect them in the unit which is being tested. Maybe on another unit you don't want some factual, you can easily ignore them.

![](Mockia.png)
