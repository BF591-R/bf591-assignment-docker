# test test
docker run --rm -v $PWD/workspace:/github/workspace bf591-r-docker test main.R test_main.R test_main.out

# test knit
docker run --rm -v $PWD/workspace:/github/workspace bf591-r-docker knit main.R report.Rmd reference_report.html rmarkdown_build.out
