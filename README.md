
# hbdjoel

<!-- badges: start -->
<!-- badges: end -->

The goal of hbdjoel is to read birthday messages for Joel fancily. 

## Installation

You can install the released version of hbdjoel from [hbdjoel](https://github/psy218/hbdjoel) with:

``` r
devtools::install_github("psy218/hbdjoel")
```

## Example

Are you feeling adventurous? Simply run the function with no argument. 

``` r
library(hbdjoel)
hbd_joel()
```
This will randomly sample one birthday wish, and make you feel super risk-taking. 

Do you have someone in mind, and wonder if they wished you happy birthday? Type their name (in with no capital letter).
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
