const List<String> planets = [
  'mercury',
  'venus',
  'earth',
  'mars',
  'jupiter',
  'saturn',
  'uranus',
  'neptune'
];

const Map<String, Map> planetsInfo = {
  'mercury': {
    'description':
        'Mercury is the smallest planet in our solar system. It’s just a little bigger than Earth’s moon. It is the closest planet to the sun, but it’s actually not the hottest. Venus is hotter.',
    'distance': '77 million kilometers',
    'volume': '0.056 Earths',
    'mass': '0.055 Earths',
    'day': '59 Earth days',
    'year': '88 Earth days',
    'wikipedia': 'https://en.wikipedia.org/wiki/Mercury_(planet)',
    'nasa': 'https://solarsystem.nasa.gov/planets/mercury/overview/',
  },
  'venus': {
    'description':
        'Even though Venus isn\'t the closest planet to the sun, it is still the hottest. It has a thick atmosphere full of the greenhouse gas carbon dioxide and clouds made of sulfuric acid.',
    'distance': '261 million kilometers',
    'volume': '0.866 Earths',
    'mass': '0.815 Earths',
    'day': '243 Earth days',
    'year': '225 Earth days',
    'wikipedia': 'https://en.wikipedia.org/wiki/Venus',
    'nasa': 'https://solarsystem.nasa.gov/planets/venus/overview/',
  },
  'earth': {
    'description':
        'Our home planet Earth is a rocky, terrestrial planet. It has a solid and active surface with mountains, valleys, canyons, plains and so much more. Earth is special because it is an ocean planet. Water covers 70% of Earth\'s surface.',
    'distance': '0 kilometers',
    'volume': '1,083,206,916,846km³', //earths
    'mass': '5,972,190,000,000,000,000,000,000kg', // earths
    'day': '24 hours', // days
    'year': '365.25 days', // days
    'wikipedia': 'https://en.wikipedia.org/wiki/Earth',
    'nasa': 'https://solarsystem.nasa.gov/planets/earth/overview/',
  },
  'mars': {
    'description':
        'Mars is a cold desert world. It is half the size of Earth. Mars is sometimes called the Red Planet. It\'s red because of rusty iron in the ground',
    'distance': '225 million kilometers',
    'volume': '0.151 Earths',
    'mass': '0.107 Earths',
    'day': '24.6 hours',
    'year': '687 Earth days',
    'wikipedia': 'https://en.wikipedia.org/wiki/Mars',
    'nasa': 'https://solarsystem.nasa.gov/planets/mars/overview/',
  },
  'jupiter': {
    'description':
        'Jupiter is the biggest planet in our solar system. It\'s similar to a star, but it never got big enough to start burning',
    'distance': '588 million kilometers',
    'volume': '1,321 Earths',
    'mass': '317.8 Earths',
    'day': '10 hours',
    'year': '11.8 Earth years',
    'wikipedia': 'https://en.wikipedia.org/wiki/Jupiter',
    'nasa': 'https://solarsystem.nasa.gov/planets/jupiter/overview/',
  },
  'saturn': {
    'description':
        'Saturn isn’t the only planet to have rings, but it definitely has the most beautiful ones. The rings we see are made of groups of tiny ringlets that surround Saturn. They’re made of chunks of ice and rock.',
    'distance': '1.2 billion kilometers',
    'volume': '763.59 Earths',
    'mass': '95.159 Earths',
    'day': '10.7 hours',
    'year': '29 Earth years',
    'wikipedia': 'https://en.wikipedia.org/wiki/Saturn',
    'nasa': 'https://solarsystem.nasa.gov/planets/saturn/overview/',
  },
  'uranus': {
    'description':
        'Uranus is made of water, methane, and ammonia fluids above a small rocky center. Its atmosphere is made of hydrogen and helium like Jupiter and Saturn, but it also has methane. The methane makes Uranus blue.',
    'distance': '2.6 billion kilometers',
    'volume': '63.086 Earths',
    'mass': '14.536 Earths',
    'day': '17 hours',
    'year': '84 Earth years',
    'wikipedia': 'https://en.wikipedia.org/wiki/Uranus',
    'nasa': 'https://solarsystem.nasa.gov/planets/uranus/overview/',
  },
  'neptune': {
    'description':
        'It\'s more than 30 times as far from the sun as Earth is. Its atmosphere is made of hydrogen, helium, and methane. The methane gives Neptune the same blue color as Uranus. Neptune has six rings, but they\'re very hard to see.',
    'distance': '4.3 billon kilometers',
    'volume': '57.74 Earths',
    'mass': '17.147 Earths',
    'day': '16 hours',
    'year': '165 Earth years',
    'wikipedia': 'https://en.wikipedia.org/wiki/Neptune',
    'nasa': 'https://solarsystem.nasa.gov/planets/neptune/overview/',
  },
};
