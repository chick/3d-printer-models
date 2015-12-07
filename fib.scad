
function fib(n) = (n <= 1 ?  1: fib(n-1) + fib(n-2));

for( i = [1 : 30]) {
    rotate([fib(i),fib(i),fib(i)]) {
        translate([fib(i), 0, 0]) {
            // echo("fib[", i, "] -> ", fib(i));
            sphere(fib(i));
        }
    }
}
 
