<template>
  <div class="structureDiagram">
    <b-card>
      <!-- <b-card-img-lazy src="/assets/images/struktur.png"></b-card-img-lazy> -->
      <organization-chart :datasource="ds"></organization-chart>
    </b-card>
  </div>
</template>

<script>
import OrganizationChart from "vue-organization-chart";
import "vue-organization-chart/dist/orgchart.css";

export default {
  components: {
    OrganizationChart,
  },
  data() {
    return {
      ds: {
        id: "1",
        name: "Tri Hariyanto",
        title: "Direktur",
        code: "",
        children: [
          {},
          {
            id: "2",
            name: "M. Balhaqi M.",
            title: "Ka. Div Pelatihan",
            code: "",
            children: [
              {
                id: "3",
                name: "",
                title: "Trainer",
                children: [
                  { id: "4", name: "", title: "Peserta Didik" },
                  // {
                  //   id: "5",
                  //   name: "Hei Hei",
                  //   title: "senior engineer",
                  //   children: [
                  //     { id: "6", name: "Pang Pang", title: "engineer" },
                  //     { id: "7", name: "Xiang Xiang", title: "UE engineer" },
                  //   ],
                  // },
                ],
              },
            ],
          },

          {},

          {
            id: "5",
            name: "Haryanto Bilal M",
            title: "Ka. Div Operasional",
            code: "",
          },

          {},
          {
            id: "6",
            name: "Yusuf Ardianto",
            title: "Ka. Div Finance",
            code: "",
          },

          {},
          {
            id: "7",
            name: "Anjrah Ari Susanto",
            title: "Ka. Div Human Capital",
            code: "",
          },

          {},
          {
            id: "8",
            name: "Anjrah Ari Susanto",
            title: "Ka. Div Marketing",
            code: "",
          },
        ],
      },
    };
  },
};
</script>

<style lang="scss">
.card-body {
  padding: 0;
}
.card-body .orgchart-container {
  border: none;
}
.card-body .orgchart-container .orgchart {
  background-image: none;
}

.orgchart div.node div.title {
  font-style: normal;
  font-weight: normal;
  background-color: transparent;
  font-size: 14px;
  letter-spacing: 0.01em;
  text-align: left;
  color: #121527;
  i {
    display: none;
  }
}

.orgchart div.node div.content {
  font-style: normal;
  font-weight: 600;
  font-size: 16px;
  line-height: 140%;
  text-align: left;
  background-color: transparent;
  border: none;
  letter-spacing: 0.01em;
  color: #121527;
}

#app
  > div
  > div.aboutUs
  > section.struktur
  > div.row.justify-content-center.flex-row
  > div.col-md-12
  > div
  > div
  > div
  > div
  > div
  > div
  > div
  > table
  > tbody
  > tr.nodes
  > td:nth-child(1)
  > table
  > tbody
  > tr
  > td
  > div,
#app
  > div
  > div.aboutUs
  > section.struktur
  > div.row.justify-content-center.flex-row
  > div.col-md-12
  > div
  > div
  > div
  > div
  > div
  > div
  > div
  > table
  > tbody
  > tr.nodes
  > td:nth-child(3)
  > table
  > tbody
  > tr
  > td
  > div,
#app
  > div
  > div.aboutUs
  > section.struktur
  > div.row.justify-content-center.flex-row
  > div.col-md-12
  > div
  > div
  > div
  > div
  > div
  > div
  > div
  > table
  > tbody
  > tr.nodes
  > td:nth-child(5)
  > table
  > tbody
  > tr
  > td
  > div,
#app
  > div
  > div.aboutUs
  > section.struktur
  > div.row.justify-content-center.flex-row
  > div.col-md-12
  > div
  > div
  > div
  > div
  > div
  > div
  > div
  > table
  > tbody
  > tr.nodes
  > td:nth-child(7)
  > table
  > tbody
  > tr
  > td
  > div,
#app
  > div
  > div.aboutUs
  > section.struktur
  > div.row.justify-content-center.flex-row
  > div.col-md-12
  > div
  > div
  > div
  > div
  > div
  > div
  > div
  > table
  > tbody
  > tr.nodes
  > td:nth-child(9)
  > table
  > tbody
  > tr
  > td
  > div {
  width: 72px;
}
</style>
