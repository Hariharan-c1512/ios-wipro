final class Box {
    deinit { print("Box gone") }
}
var a: Box? = Box()
var b = a
var c = a
a = nil
b = nil
print("before c")
c = nil // Last strong reference is removed here; prints "Box gone".
print("end")
