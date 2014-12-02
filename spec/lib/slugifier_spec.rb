require "spec_helper"
require "slugifier"

describe Slugifier do
  it "should change spaces to hyphen and accented vowels to simple vowels" do
    Slugifier.convert("Hola que mas, cómo estás?").should == "hola-que-mas-como-estas"
  end

  it "should change accented vowels to normal vowels" do
    Slugifier.convert("'áéíóú 123").should == "aeiou-123"
  end

  it "should trim multiple spaces and delete exclamation marks" do
    Slugifier.convert("A mi       me gusta     Make It Real!!!!").should == "a-mi-me-gusta-make-it-real"
  end

  it "should convert accented uppercase vowels to normal vowels" do
    Slugifier.convert("'ÁÉÍÓÚ 123").should == "aeiou-123"
  end

  it "should convert a ñ to an n" do
    Slugifier.convert("cuantos años tienes?").should == "cuantos-anos-tienes"
  end

  it "should trim spaces at the start and end of string" do
    Slugifier.convert("   Hola, que más, como estas    ").should == "hola-que-mas-como-estas"
  end

  it "should convert multiple hyphens to a single one" do
    Slugifier.convert("hola --- tengo muchos guiones----____").should == "hola-tengo-muchos-guiones"
  end
end