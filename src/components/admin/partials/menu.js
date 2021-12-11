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
    role: "hrd staff",
  },
  {
    id: 3,
    label: "About",
    icon: "ri-honour-fill",
    role: "hrd",
    subItems: [
      {
        id: 31,
        label: "Visi Misi",
        link: "/admin/about",
        role: "hrd staff",
      },
      {
        id: 32,
        label: "Legalitas",
        link: "/admin/about/legalitas",
        role: "hrd staff",
      },
      {
        id: 33,
        label: "Struktur LPK",
        link: "/admin/about/struktur",
        role: "hrd staff",
      },
      {
        id: 34,
        label: "Liputan",
        link: "/admin/about/liputan",
        role: "hrd",
      },
      {
        id: 35,
        label: "Cabang",
        link: "/admin/about/cabang",
        role: "hrd staff",
      },
    ],
  },
  {
    id: 4,
    label: "Instruktur",
    icon: "ri-customer-service-line",
    role: "hrd staff",
    subItems: [
      {
        id: 4111,
        label: "Instruktur",
        link: "/admin/instruktur",
        role: "hrd staff",
      },
      {
        id: 4222,
        label: "Kurikulum",
        link: "/admin/instruktur/kurikulum",
        role: "hrd staff",
      },
    ],
  },
  {
    id: 41,
    label: "Pelatihan",
    icon: "ri-at-fill",
    role: "hrd staff",
    subItems: [
      {
        id: 411,
        label: "Pelatihan",
        link: "/admin/pelatihan",
        role: "hrd staff",
      },
      {
        id: 422,
        label: "Timeline",
        link: "/admin/pelatihan/timeline",
        role: "hrd staff",
      },
    ],
  },
  {
    id: 5,
    label: "Images",
    icon: "ri-gallery-line",
    role: "hrd staff",
    subItems: [
      {
        id: 51,
        label: "Galeri",
        link: "/admin/images",
        role: "hrd staff",
      },
      {
        id: 52,
        label: "Kopdar Alumni",
        link: "/admin/images/alumni",
        role: "hrd staff",
      },
    ],
  },
  {
    id: 6,
    label: "Loker",
    icon: "ri-hotel-line",
    role: "staff",
    subItems: [
      {
        id: 61,
        label: "List",
        link: "/admin/loker",
        role: "staff",
      },
      {
        id: 62,
        label: "Status Pelamar",
        link: "/admin/loker/status",
        role: "staff",
      },
      {
        id: 63,
        label: "Kuis",
        link: "/admin/loker/kuis",
        role: "staff",
      },
    ],
  },
  {
    id:998,
    label: "Alumni",
    icon: "ri-feedback-line",
    link: "/admin/alumni",
    role: "hrd staff",
  }, {
    id: 8,
    label: "Testimoni",
    icon: "ri-feedback-line",
    link: "/admin/testimoni",
    role: "hrd staff",
  },
  {
    id: 7,
    label: "Setting",
    icon: "ri-settings-2-line",
    link: "/admin/setting",
    role: "hrd staff",
  },
];
