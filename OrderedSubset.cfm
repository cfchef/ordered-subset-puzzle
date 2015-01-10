<cfscript>
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

	subset = ["four", "two"];

	writeDump(getOrderedSubset(set, subset));

	public array function getOrderedSubset(required struct set, required array subset)
		output="false"
	{
		return subset.filter(function(e) {
			return structKeyExists(set, e);
		}).map(function(v, i) {
			set[v].label = v;
			return set[v];
		});
	}

</cfscript>