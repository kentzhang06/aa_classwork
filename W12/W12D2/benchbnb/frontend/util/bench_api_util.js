export const fetchBenches = (filters) => {
  return $.ajax({
    url: '/api/benches',
    method: 'GET',
    data: filters,
    error: (err) => console.log(err)
  });
};

