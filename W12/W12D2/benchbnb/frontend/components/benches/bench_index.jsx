import React from "react";
import BenchIndexItem from "./bench_index_item";

class BenchIndex extends React.Component {
  // componentDidMount() {
  //   // request benches from your API here
  //   this.props.fetchBenches();
  // }

  render() {
    const { benches } = this.props;

    let displayBenches = benches.map((bench) => <BenchIndexItem key={bench.id} bench={bench} /> );

    return (
      <ul>
        { displayBenches }
      </ul>
    )
  }
}

export default BenchIndex;