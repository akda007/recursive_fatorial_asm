int fact(int n) {
  if (n == 0) {
    return 1;
  } else {
    return n * fact(n - 1);
  }
}

int main() {
  int a;
  printf("Enter a number: ");
  scanf("%d", &a);
  int result = fact(a);
  printf("The factorial of %d is %d\n", a, result);
  return 0;
}
