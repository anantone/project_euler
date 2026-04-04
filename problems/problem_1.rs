fn main() {
    let sum: i32 = (0..1000)
        .filter(|i| i % 3 == 0 || i % 5 == 0)
        .sum();
    println!("{}", sum);
}
