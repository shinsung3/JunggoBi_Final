<!--itemList component 아이템 목록 -->
<template>
  <v-container class="pa-2" fluid grid-list-md>
    <div>
      <v-flex>
        <v-row>
          <!-- 수정중 부분-->
          <!-- <HistogramSlider
            style="margin: 200px auto"
            :width="600"
            :bar-height="50"
            :data="data"
            :drag-interval="true"
            :force-edges="false"
            :colors="['#4facfe', '#00f2fe']"
            :min="defaultMin"
            :max="defaultMax"
            :step="10000"
            @finish="finish"
          /> -->
          <!-- start : sort_methods 정렬방법 설정 -->
          <v-col>
            <v-row>
              <v-select
                v-model="sortMethod"
                :items="sortMethodList"
                label="정렬방법"
                dense
                :hint=itemLen()
                persistent-hint
                @change="sortyBy()"
              ></v-select>
            </v-row>
          </v-col>
          <!-- end : sort_methods -->
          
          <!-- start : avgChart 평균가 차트 -->
          <v-col align-self="center">
            <div class="hidden-sm-and-down" style="cursor:pointer" @click="avgChart = true" >
              <v-alert outlined dense color="info">
                <span class="mdi mdi-poll-box"></span> 
                가격 변동 
              </v-alert>
            </div>
            <v-snackbar color="white" v-model="avgChart" :timeout="timeout">
            <v-col>
              <v-row>
                <multipleChart></multipleChart>
              </v-row>
              <v-row justify="end" >
                <v-btn color="grey" text @click="avgChart = false">Close</v-btn>
              </v-row>
            </v-col>
            </v-snackbar>
          </v-col>
          <!-- end : avgChart -->
        </v-row>

        <v-row>
          <!-- start : itemListCards 아이템 리스트 출력 -->
          <v-col> <!-- v-if="loadingList" -->
            <!-- <itemListCard v-for="card in itemListCards" :key="card.name" :item="card" class="mt-1"></itemListCard> -->
            <itemListCard v-for="i in itemsUsed.length > length ? length : itemsUsed.length"
              :key="i" :item="itemsUsed[i-1]" class="mt-1"/>
          </v-col>
          <!-- end : itemListCards -->
        
        </v-row>
        <v-row>

          <!-- start : lodingBar 출력부 -->
          <v-col><!-- v-if="loading===false"-->
            <loadingImg></loadingImg>   
          </v-col>
          <!-- end : loadingBar -->

        </v-row>
        <v-row>

          <!-- start : loadMore button 더 보기 버튼 -->
          <v-col v-if="moreBtn">
            <v-btn outlined @click = "loadMore">더보기</v-btn>
          </v-col>
          <!-- end : loadMore -->
          
        </v-row>
      </v-flex>
      
      <!-- start : gotoTop button 맨위로 버튼 -->
      <v-btn
        v-scroll="onScroll" v-show="fab"
        fab dark fixed bottom right
        color="primary" @click="toTop"
      >
      <v-icon>keyboard_arrow_up</v-icon>
    </v-btn> 
    <!-- end : gotoTop button -->

    </div>
  </v-container>
</template>

<script>
import HistogramSlider from 'vue-histogram-slider';
import 'vue-histogram-slider/dist/histogram-slider.css';

export default {
  props: {
    itemListCards: {
      type: Array,
      default: () => new Array(),
    }
  },
  data: () => ({
    avgChart: false,  // 평균 비교 차트
    timeout: 10000,   // 차트 생존 시간
    sortMethod: "",   // 정렬 방법
    sortMethodList: ["높은가격순", "낮은가격순"], // 정렬 방법 리스트
    length: 10,         // 첫 검색시 출력될 아이템 갯수
    fab: false,         
    moreBtn: true,      // 더보기버튼 출력
    loading: false,     // 로딩 이미지 출력
    loadingList: true, // 카드리스트 출력 
    chartMin: 0,
    chartMax: 0,
    chartSx: 0,
    chartLx: 0,
    defaultMin: 0,
    defaultMax: 0,
    data: [],
    itemsUsed: []
  }),
  methods:{
    sortByLowToHigh_price() { // 정렬 - 낮은가격순
      this.itemsUsed = this.itemListCards;
      this.itemsUsed.sort((a,b) => a['price'] < b['price'] ? -1 : 1)
    },
    sortByHighToLow_price() { // 정렬 - 높은가격순
      this.itemsUsed = this.itemListCards;
      this.itemsUsed.sort((a,b) => a['price'] > b['price'] ? -1 : 1)
    },
    sortByRange() {
      let max = Math.max.apply(Math, this.itemListCards.map(function(o) { return o.price }))
      let min = Math.min.apply(Math, this.itemListCards.map(function(o) { return o.price }))
      // this.itemListCards.sort((a,b) => a['price'] > b['price'] ? -1 : 1)
      // this.itemListCards.sort((a,b) => (a['price'] >= this.chartSx)&&(a['price'] <= this.chartLx)  ? -1 : 1)
      var list = [];
      console.log(this.chartLx + " " + this.chartSx)
      for(var i = 0; i< this.itemListCards.length; i++) {
        if( (this.itemListCards[i].price>= this.chartSx) && (this.itemListCards[i].price<=this.chartLx) ){
          list.push(this.itemListCards[i])
        }
      }
      list.sort((a,b) => a['price'] < b['price'] ? -1 : 1)
      this.itemsUsed = list;
    },
    sortyBy() { //select 된 정렬 방법 메소드 실행
      if(this.sortMethod==="높은가격순") {
        this.sortByHighToLow_price();
      } else {
        this.sortByLowToHigh_price();
      }
    },
    itemLen() { // 검색된 데이터 정보 양 출력
      return "검색 결과 : " + this.itemListCards.length + " 건";
    },
    loadMore() {  // 더보기 버튼 
      this.loadingTimer(1000)
      this.length += 10;
      if (this.length >= this.itemListCards.length) this.moreBtn = false;
      
    },
    onScroll (e) {  // 맨위로 이동
      if (typeof window === 'undefined') return
      const top = window.pageYOffset ||   e.target.scrollTop || 0
      this.fab = top > 20
    },
    toTop () {      // 맨위좌표 기억
      this.$vuetify.goTo(0)
    },
    loadingTimer(timer) { //이미지 로딩바 출력부분
      let self=this;
      this.loading = false;
      setTimeout(function(){self.loading = true; self.loadingList=true}, timer);
    },
    finish(val) { 
      console.log(val);
      let arr = [];
      arr[0] = val.from;
      arr[1] = val.to;
      this.chartSx = val.from;
      this.chartLx = val.to;
      console.log(this.chartMin + " dasf")
      let a = this.sortByRange();
    },
  },
  created() {
    // this.loadingTimer(3000) // 화면전환시 로딩바 출력 부분
    this.itemsUsed = this.itemListCards;
    for(var i=0; i<this.itemListCards.length; i++){
      this.data[i] = this.itemListCards[i].price;
    }
  }
}
</script>
