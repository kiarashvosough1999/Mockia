# ``Mockia``

Easy Handling Mock's internal Expectations in Swift.

## Overview

Ever tried to put expectations inside the mocks? It is not the best practice to directly put `XCAssert` inside mocks and check something on each unit test.

What if on one unit everythings change and the assertions fail and no longer valid?

`Mockia` enables you to put expectations inside mocks and verify them the way unit test requires. You can set factual actions inside your mocks and expect them in the unit which is being tested. Maybe on another unit you don't want some factual, you can easily ignore them.

![](Mockia.png)
