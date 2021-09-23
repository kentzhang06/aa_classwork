import React from "react";
import BenchMap from "./bench_map";
import BenchIndex from "./bench_index";

class Search extends React.Component {

  render() {
    const { benches, fetchBenches, updateBounds } = this.props;

    return(
      <div>
        <BenchMap benches={benches} updateBounds={updateBounds}/>
        <BenchIndex benches={benches} fetchBenches={fetchBenches} />
      </div>
    )
  }
}

export default Search;