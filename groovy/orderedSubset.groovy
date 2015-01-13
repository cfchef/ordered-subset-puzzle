def set = [
    one : [
        alphabet : "a",
        maori : "tahi",
        roman : "i",
        ordinal : "first"
    ],
    two : [
        alphabet : "b",
        maori : "rua",
        roman : "ii",
        ordinal : "second"
    ],
    three : [
        alphabet : "c",
        maori : "toru",
        roman : "iii",
        ordinal : "third"
    ],
    four : [
        alphabet : "d",
        maori : "wha",
        roman : "iv",
        ordinal : "fourth"
    ]
]

def subset = ["four", "two"]

List orderedSubset(Map set, List subset) {
    return subset.findAll { set.containsKey(it) }.inject([]) { list, v ->
        set[v]?.label = v; list << set[v]
    }   
}

println(orderedSubset(set, subset))

//*** Tests ***//
// result is ArrayList
assert orderedSubset(set, subset).getClass() == java.util.ArrayList
// result Maps contain key: label
assert orderedSubset(set, subset)[0].containsKey("label") == true
assert orderedSubset(set, subset)[1].containsKey("label") == true
// result List elements are in same order as subset
assert orderedSubset(set, subset)[0].label == "four"
assert orderedSubset(set, subset)[1].label == "two"
// subset list elements not found in set maps are not persisted into result
assert orderedSubset(set, ["four", "two", "twelve"]).size() == 2