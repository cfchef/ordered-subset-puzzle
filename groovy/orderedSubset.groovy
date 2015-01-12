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
    List list = []
    subset.findAll { set.containsKey(it) }.each { e -> set[e].label = e; list << set[e] }
    
    return list
}

println(orderedSubset(set, subset))