component extends="testbox.system.BaseSpec"{
    // executes before all suites
    function beforeAll() {
        include "OrderedSubset.cfm";
        set = {
            one : {
                alphabet : "a",
                maori : "tahi",
                roman : "i",
                ordinal : "first"
            },
            two : {
                alphabet : "b",
                maori : "rua",
                roman : "ii",
                ordinal : "second"
            },
            three : {
                alphabet : "c",
                maori : "toru",
                roman : "iii",
                ordinal : "third"
            },
            four : {
                alphabet : "d",
                maori : "wha",
                roman : "iv",
                ordinal : "fourth"
            }
        };
        subset = ["four", "two", "twelve"];
    }

    // executes after all suites
    function afterAll() {}

    // All suites go in here
    function run( testResults, testBox ){
        describe("Ordered Subset", function() {
            describe("Arguments", function() {
                it("[set] should be a structure", function() {
                    expect(set).toBeStruct();
                });
                it("[subset] should be an array", function() {
                    expect(subset).toBeArray();
                });
            });
            describe("Function Result", function() {
                it("should return an array", function() {
                    expect(getOrderedSubset(set, subset)).toBeArray();
                });
                it("should not return subset keys that don't exist in original set", function() {
                    expect(getOrderedSubset(set, subset)).toHaveLength(2);
                });
                it("result array of structs should contain new key [label]", function() {
                    var result = getOrderedSubset(set, ["four", "two"]);
                    expect(result[1]).toHaveKey("label");
                    expect(result[2]).toHaveKey("label");
                });
                it("result array of structs should be in order of subset elements", function() {
                    expect(getOrderedSubset(set, subset)[1].label).toBe(subset[1]);
                    expect(getOrderedSubset(set, subset)[2].label).toBe(subset[2]);
                });
            });
        });
    }
}