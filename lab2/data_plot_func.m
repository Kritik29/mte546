function data_plot_func(x_data, y_data, legend_text, title_text, x_label_text, y_label_text, color_text)
disp(size(x_data))
disp(size(y_data))
figure;

for i = 1:size(y_data,1)
    plot(x_data(i,:), y_data(i,:), color_text(i));
    hold on;
end
hold off;
axis([0 10 0 30])
legend(legend_text);
xlabel(x_label_text);
ylabel(y_label_text);
title(title_text);

end

