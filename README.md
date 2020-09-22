
# September 24: Birth of Joel Day

<!-- badges: start -->
<!-- badges: end -->

The goal of hbdjoel is to *fancily* deliver birthday messages to Joel from those who love him. 

## Installation

You can install the released version of hbdjoel from [hbdjoel](https://github/psy218/hbdjoel) with:

``` r
devtools::install_github("psy218/hbdjoel")
```

Load the package. 
``` r
library("hbdjoel")
```

## Example
To start off, let's quiz your knowledge about your loved ones! 
The following code will read a birthday wish from one of people and give you one chance to guess who sent the message.   
``` r
guess_who()
```

You can continue quizzing yourself, but if you are frustrated run `hbd_joel()` with an argument for `from_who`. 
If you are feeling adventurous, run the function with "anyone". 
``` r
hbd_joel(from_who = "anyone")
```
This will randomly sample one birthday message, and make you feel super risk-taking. 

Do you have someone in mind, and wonder if they wished Joel happy birthday?   
Type their name!  
``` r
hbd_joel(who = "joel")
```
Or, maybe you have multiple people in mind:
``` r
hbd_joel(who = c("joel", "joel v2"))
```

Hey, if you need tons of love, try "everyone"
``` r
hbd_joel(who = "everyone")
```
