const std = @import("std");
const tst = std.testing;

const MyStruct = struct {
    a: i32 = 0,
    b: i32 = 0,

    const Self = @This();

    export fn allNines(self: *Self) void {
        self.*.a = 9;
        self.*.b = 9;
    }
};

export fn add(a: i32, b: i32) i32 {
    return a + b;
}

test "basic add functionality" {
    try tst.expect(add(3, 7) == 10);
}

test "all nines" {
    var strt = MyStruct{};
    strt.allNines();

    try tst.expectEqual(strt.a, 9);
}
