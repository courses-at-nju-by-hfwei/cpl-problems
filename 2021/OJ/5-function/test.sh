TAR=$1
echo "Running" $TAR "tests..."
echo 

cat test/$TAR.in | ./$TAR >reslut.out
output=$(cat reslut.out)
expected_output=$(cat test/$TAR.out)

if [ $? -eq 0 ] ; then
  echo "Pass: Program exited zero"
else
  echo "Fail: Program did not exit zero"
  exit 1
fi

echo
diff -b test/$TAR.out reslut.out > /dev/null


if [ $? -eq 0 ] ; then
  echo "Pass: Output is correct"
else
  echo "Expected '$expected_output' but got: $output"
  exit 1
fi

echo
echo "All tests passed."
echo

exit 0