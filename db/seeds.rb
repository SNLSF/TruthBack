# traits people describe users' photos with
word_bank = [
  "mysterious",
  "serious",
  "intelligent",
  "easy-going",
  "ambitious",
  "fun",
  "unique",
  "sexy",
  "vain",
  "athletic",
  "artistic",
  "wholesome",
  "wild",
  "unusual",
  "attractive",
  "outdoorsy",
  "kinky",
  "weird",
  "professional",
  "wealthy",
  "high-maintenance",
  "health-conscious",
  "traditional",
  "social",
  "unhealthy"
]

word_bank.each do |trait|
  Trait.create(word: trait)
end
