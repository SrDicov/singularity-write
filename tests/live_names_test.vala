using Singularity.Apps;

void test_display_name_disambiguates() {
    var s = new WriteLiveSession("Prova Test");
    var a = new WriteLivePeer();
    a.id = "a";
    a.name = "Prova Test";
    a.host = "node2";
    s.peers["a"] = a;
    assert(s.display_name(a) == "Prova Test (node2)");
    var b = new WriteLivePeer();
    b.id = "b";
    b.name = "Anna";
    b.host = "node3";
    s.peers["b"] = b;
    assert(s.display_name(b) == "Anna");
    var c = new WriteLivePeer();
    c.id = "c";
    c.name = "Anna";
    s.peers["c"] = c;
    assert(s.display_name(b) == "Anna (node3)");
    assert(s.display_name(c) == "Anna");
}

int main(string[] args) {
    Test.init(ref args);
    Test.add_func("/live/display-name", test_display_name_disambiguates);
    return Test.run();
}
