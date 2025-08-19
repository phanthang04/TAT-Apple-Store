#include <boost/graph/adjacency_list.hpp>
#include <boost/graph/topological_sort.hpp>
#include <boost/graph/graphviz.hpp>
#include <boost/graph/strong_components.hpp>
#include <boost/graph/filtered_graph.hpp>
#include <boost/property_map/property_map.hpp>
#include <iostream>
#include <vector>
#include <unordered_set>

// Định nghĩa đồ thị có hướng
using Graph = boost::adjacency_list<boost::vecS, boost::vecS, boost::directedS>;
using Vertex = Graph::vertex_descriptor;
using Edge = Graph::edge_descriptor;

// Hàm kiểm tra chu trình
bool hasCycle(const Graph& g) {
    try {
        boost::topological_sort(g, std::back_inserter(std::vector<Vertex>()));
        return false;
    } catch (const boost::not_a_dag& e) {
        return true;
    }
}

// Loại bỏ cạnh và kiểm tra chu trình
void removeEdgeAndCheck(Graph& g, Edge e) {
    boost::remove_edge(e, g);
}

// Thuật toán tìm FAS
std::vector<Edge> findFeedbackArcSet(Graph& g) {
    std::vector<Edge> fas;
    auto ei = boost::edges(g);
    for (auto it = ei.first; it != ei.second; ++it) {
        Edge e = *it;
        Graph g_copy = g; // Tạo bản sao đồ thị
        removeEdgeAndCheck(g_copy, e);
        if (!hasCycle(g_copy)) {
            fas.push_back(e);
        }
    }
    return fas;
}

int main() {
    // Khởi tạo đồ thị
    Graph g;

    // Thêm đỉnh và cạnh vào đồ thị
    Vertex v1 = boost::add_vertex(g);
    Vertex v2 = boost::add_vertex(g);
    Vertex v3 = boost::add_vertex(g);
    boost::add_edge(v1, v2, g);
    boost::add_edge(v2, v3, g);
    boost::add_edge(v3, v1, g); // Tạo chu trình

    // Kiểm tra chu trình
    if (hasCycle(g)) {
        std::cout << "Đồ thị có chu trình." << std::endl;
    } else {
        std::cout << "Đồ thị không có chu trình." << std::endl;
    }

    // Tìm FAS
    std::vector<Edge> fas = findFeedbackArcSet(g);
    std::cout << "Tập cung phản hồi tối thiểu:" << std::endl;
    for (const auto& e : fas) {
        std::cout << "(" << boost::source(e, g) << ", " << boost::target(e, g) << ")" << std::endl;
    }

    return 0;
}