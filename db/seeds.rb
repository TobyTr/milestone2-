# frozen_string_literal: true

# user1 = User.create!(
#  email:    'learra@mail.com',
#  password: 'learra'
# )

user1 = User.create!(
  email:    'learra@mail.com',
  password: 'learra'
)

# Create a few builds
build1 = Build.create(name: 'Gaming PC Build', description: 'High-end build for gaming', published: true,
                      creator: user1)
build2 = Build.create(name: 'Workstation Build', description: 'Build for professional workstations', published: true,
                      creator: user1)

# Create parts
CATEGORIES = ['GPU', 'CPU', 'Motherboard', 'Memory', 'Storage', 'CPU Cooler', 'PSU']

Part.create!([
               # GPUs
               { name: 'RTX 4090', brand: 'NVIDIA', price: 1599.99, year: 2023, category: 'GPU',
                 description: 'Flagship graphics card with DLSS 3.0 and ray tracing capabilities', image: 'parts/rtx_4090.png' },
               { name: 'RTX 3080', brand: 'NVIDIA', price: 699.99, year: 2020, category: 'GPU',
                 description: 'Popular Ampere architecture GPU with 10GB VRAM', image: 'parts/rtx_3080.jpg' },
               { name: 'RX 6800 XT', brand: 'AMD', price: 649.99, year: 2021, category: 'GPU',
                 description: 'High-performance RDNA 2 graphics card', image: 'parts/rx_6800_xt.jpg' },

               # CPUs
               { name: 'Core i9-14900K', brand: 'Intel', price: 589.99, year: 2024, category: 'CPU',
                 description: '24-core processor for ultimate gaming and productivity', image: 'parts/core_i9_14900k.jpg' },
               { name: 'Ryzen 5 5600X', brand: 'AMD', price: 299.99, year: 2020, category: 'CPU',
                 description: 'Popular 6-core gaming processor with Zen 3 architecture', image: 'parts/ryzen55600x.jpg' },
               { name: 'Core i7-12700K', brand: 'Intel', price: 409.99, year: 2022, category: 'CPU',
                 description: '12th gen processor with hybrid architecture', image: 'parts/corei712700k.jpg' },

               # Motherboards
               { name: 'ROG Maximus Z790', brand: 'ASUS', price: 629.99, year: 2023, category: 'Motherboard',
                 description: 'High-end Intel Z790 motherboard with WiFi 6E', image: 'parts/rogmaximusz790.png' },
               { name: 'B550 Tomahawk', brand: 'MSI', price: 179.99, year: 2020, category: 'Motherboard',
                 description: 'Popular AM4 motherboard for Ryzen 5000 series', image: 'parts/b550tomahawk.jpg' },
               { name: 'Z690 Aorus Pro', brand: 'Gigabyte', price: 289.99, year: 2021, category: 'Motherboard',
                 description: 'Feature-rich Intel 12th gen motherboard', image: 'parts/z690aoruspro.jpg' },

               # Memory
               { name: 'Trident Z5 RGB', brand: 'G.SKILL', price: 189.99, year: 2023, category: 'Memory',
                 description: '32GB DDR5-6000 RGB RAM kit', image: 'parts/tridentz5rgb.jpg' },
               { name: 'Vengeance LPX', brand: 'Corsair', price: 89.99, year: 2020, category: 'Memory',
                 description: '16GB DDR4-3200 low-profile RAM kit', image: 'parts/vengeancelpx.jpg' },
               { name: 'Ripjaws V', brand: 'G.SKILL', price: 109.99, year: 2021, category: 'Memory',
                 description: '32GB DDR4-3600 dual-rank kit', image: 'parts/ripjawsv.png' },

               # Storage
               { name: '990 PRO', brand: 'Samsung', price: 189.99, year: 2023, category: 'Storage',
                 description: '2TB PCIe 4.0 NVMe SSD with heatsink', image: 'parts/990pro.jpg' },
               { name: 'SN750', brand: 'Western Digital', price: 129.99, year: 2020, category: 'Storage',
                 description: '1TB PCIe 3.0 NVMe gaming SSD', image: 'parts/sn750.png' },
               { name: 'P2', brand: 'Crucial', price: 79.99, year: 2021, category: 'Storage',
                 description: '1TB budget NVMe SSD', image: 'parts/p2.jpg' },

               # CPU Coolers
               { name: 'Kraken Z73 RGB', brand: 'NZXT', price: 299.99, year: 2023, category: 'CPU Cooler',
                 description: '360mm AIO liquid cooler with LCD display', image: 'parts/krakenz73rgb.jpg' },
               { name: 'Dark Rock Pro 4', brand: 'be quiet!', price: 89.99, year: 2020, category: 'CPU Cooler',
                 description: 'High-performance dual tower air cooler', image: 'parts/darkrockpro4.jpg' },
               { name: 'H100i Elite', brand: 'Corsair', price: 159.99, year: 2022, category: 'CPU Cooler',
                 description: '240mm AIO with LCD pump cap', image: 'parts/h100ielite.jpg' },

               # PSUs
               { name: 'ROG Thor 1200W', brand: 'ASUS', price: 299.99, year: 2023, category: 'PSU',
                 description: '1200W Platinum PSU with OLED power display', image: 'parts/rogthor1200w.jpg' },
               { name: 'RM750', brand: 'Corsair', price: 119.99, year: 2020, category: 'PSU',
                 description: '750W Gold rated modular power supply', image: 'parts/rm750.jpg' },
               { name: 'Focus GX-850', brand: 'Seasonic', price: 149.99, year: 2021, category: 'PSU',
                 description: '850W Gold rated fully modular PSU', image: 'parts/foxusgx850.jpg' }
             ])
