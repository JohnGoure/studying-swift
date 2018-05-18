// Practicing Recursion in Swift

func factoral(_ factor: Double) -> Double {
    if (factor == 0) {
        return 1
    }
    return factor * factoral(factor - 1)
}

var factor = factoral(4)

print(factor)
