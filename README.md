
# September 24: Birth of Joel Day

<!-- badges: start -->
<!-- badges: end -->

The goal of hbdjoel is to *fancily* deliver birthday messages for Joel from people who love Joel. 

## Installation

You can install the released version of hbdjoel from [hbdjoel](https://github/psy218/hbdjoel) with:

``` r
devtools::install_github("psy218/hbdjoel")
```

## Example

The function takes in one argument, `from_who`. 

Are you feeling adventurous? Simply run the function with "anyone". 

``` r
library("hbdjoel")
hbd_joel(from_who = "anyone")
```
This will randomly sample one birthday message, and make you feel super risk-taking. 

Do you have someone in mind, and wonder if they wished you happy birthday?   
Type their name! 
``` r
hbd_joel(who = "joel")
```
Or, maybe you had multiple people in mind?
``` r
hbd_joel(who = c("joel", "joel_v2"))
```

Hey, if you need tons of love, try "everyone"
``` r
hbd_joel(who = "everyone")
```
