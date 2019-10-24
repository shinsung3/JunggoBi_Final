const moduleB = {
  state: {
      count: 8
  },
  mutations: {
    increment (state) {
      state.count++
    }
      
  },
  getters: {
    doubleCount (state) {
      return state.count *2
    }
    
      
  },
  actions: {
      incrementIfOdd({state, commit}) {
        if (state.count %2 === 1) {
          commit('increment');
        }
      }
  }
}