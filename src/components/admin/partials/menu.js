export const menuItems = [
  {
    id: 1,
    label: "Menu",
    isTitle: true,
  },
  {
    id: 2,
    label: "Home",
    icon: "ri-home-line",
    link: "/admin",
  },
  {
    id: 3,
    label: "About",
    icon: "ri-honour-fill",
    subItems: [
      {
        id: 31,
        label: "Visi Misi",
        link: "/admin/about",
      },
      {
        id: 32,
        label: "Legalitas",
        link: "/admin/about/legalitas",
      },
      {
        id: 33,
        label: "Struktur LPK",
        link: "/admin/about/struktur",
      },
      {
        id: 34,
        label: "Liputan",
        link: "/admin/about/liputan",
      },
      {
        id: 35,
        label: "Cabang",
        link: "/admin/about/cabang",
      },
    ],
  },
  {
    id: 4,
    label: "Instruktur",
    icon: "ri-customer-service-line",
    link: "/admin/instruktur",
  },
  {
    id: 41,
    label: "Pelatihan",
    icon: "ri-at-fill",
    link: "/admin/pelatihan",
  },
  {
    id: 5,
    label: "Images",
    icon: "ri-gallery-line",
    subItems: [
      {
        id: 51,
        label: "Galeri",
        link: "/admin/images",
      },
      {
        id: 52,
        label: "Kopdar Alumni",
        link: "/admin/images/alumni",
      },
    ],
  },
  {
    id: 6,
    label: "Loker",
    icon: "ri-hotel-line",
    subItems: [
      {
        id: 61,
        label: "List",
        link: "/admin/loker",
      },
      {
        id: 62,
        label: "Status",
        link: "/admin/loker/status",
      },
    ],
  },
  {
    id: 8,
    label: "Testimoni",
    icon: "ri-feedback-line",
    link: "/admin/testimoni",
  },
  {
    id: 7,
    label: "Setting",
    icon: "ri-settings-2-line",
    link: "/admin/setting",
  },
];
