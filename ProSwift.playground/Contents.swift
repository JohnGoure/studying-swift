func fizzbuzz(_ num: Int) -> String {
    switch (num % 3 == 0, num % 5 == 0) {
    case (true,false):
        return "fizz"
    default:
        return String(num)
    }
}

let dogos = ("bob","johnson")

for case let dogo in dogos {
    
}
