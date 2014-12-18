
jest.dontMock("../../build/dood");

describe("dood", function() {
    it("adds 1", function() {
        var dood = require("../../build/dood");
        expect(dood(3)).toBe(4);
    });
});
