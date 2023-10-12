if [ -z "${1}" ];
then
    echo "Usage: entrypoint.sh (test|knit)"
    exit 1
fi

cd /github/workspace
case "${1}" in
    test)
        if [ -z "${2}" ] || [ -z "${3}" ] || [ -z "${4}" ];
        then
            echo "Usage: entrypoint.sh test <main fn> <test fn> <test results out fn>"
            exit 1
        fi

        Rscript /test.R $2 $3 $4
        ;;
    knit)
        if [ -z "${2}" ] || [ -z "${3}" ] || [ -z "${4}" ];
        then
            echo "Usage: entrypoint.sh knit <main fn> <report fn> <out html fn>"
            exit 1
        fi

        Rscript /knit.R $2 $3 $4
        ;;
    *)
        echo "Usage: entrypoint.sh (test|knit)"
        exit 1
        ;;
esac
